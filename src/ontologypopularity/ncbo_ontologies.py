import urllib.request, urllib.error, urllib.parse
import json
import os
from pprint import pprint
from secrets import api
import sys
import re
import subprocess
import shlex
import time
from eutils import Client
import csv
import requests.exceptions
from urllib3.exceptions import NewConnectionError, ConnectionError

REST_URL = "http://data.bioontology.org"
API_KEY = api.ncbo_key

def get_json(url):
    opener = urllib.request.build_opener()
    opener.addheaders = [('Authorization', 'apikey token=' + API_KEY)]
    return json.loads(opener.open(url).read())

# Get the available resources
resources = get_json(REST_URL + "/")

# Get the ontologies from the `ontologies` link
ontologies = get_json(resources["links"]["ontologies"])

# Get the name and ontology id from the returned list
ontology_output = []
ontology_names = []

print("There are {} ontologies".format(len(ontologies)))

for ontology in ontologies:
    ontology_names += [ontology['name']]
    ontology_output.append(f"{ontology['name']}\n{ontology['@id']}\n")

showUids=False
ec = Client(api_key=api.apikey)

onts = ontology_names
t0 = time.time()
with open('ncbo_citations.json','r') as cite_file:
    cits = json.load(cite_file)
    with open('ncbo_newcits.json','w') as newcites:
        for ont_name in ontology_names:
            try:
                if not re.search('Ontology|Taxonomy',ont_name,flags=re.IGNORECASE):
                    if ont_name in cits:
                        del cits[ont_name]
                    ont_name=ont_name+' Ontology'
                t1 = time.time()
                #print("time: {}".format(t1-t0))
                if t1-t0>60:
                    ec = Client(api_key=api.apikey)
                if ont_name in cits and cits[ont_name]>0:
                    pass
                else:
                    rp=re.compile("^The ")
                    ont_name=rp.sub('',ont_name)
                    ont_name=ont_name.replace('"','')
                    term="({})".format(ont_name.replace(" ", "+"))
                    a = ec.esearch(db='pubmed',term=term)
                    cits[ont_name]=a.count
                    if showUids:
                        print("{}\t{}\t{}".format(ont_name,a.count,a.ids))
                    else:
                        print("{}\t{}".format(ont_name,a.count))
                newcites.seek(0)
                json.dump(cits, newcites)
            except:
                print("I probably timed out again or whatever...lemme catch my breath")
                time.sleep(2)
                newcites.seek(0)
                json.dump(cits, newcites)
                ec = Client(api_key=api.apikey)

print("I identified {} ontologies".format(len(cits.keys())))

with open("ncbo_citations.json") as file:
    data = json.load(file)
    with open("ncbo_citations.csv", "w") as file:
        csv_file = csv.writer(file)
        csv_file.writerow(['Ontology','count'])
        for item in data.keys():
            csv_file.writerow([item,data[item]])