# The Role of Metadata in Reproducible Computational Research
This is a supplemental resource to Leipzig et al. "The Role of Metadata in Reproducible Computational Research" https://arxiv.org/pdf/2006.08589.pdf

## Organization
```
├───data/
│   ├───examples/                  Examples of metadata standards
│   ├───lens/                      Search exports for scimetric journal analysis
│   └───standards.tsv              Raw standards table
├───src/
│   ├───secrets/
│   │   └───api.template.py        Replace this with api.py using your NCBI/NCBO keys
│   ├───ncbo_ontologies.py         Scimetric ontology popularity analysis
│   ├───scimetric.ipynb            Scimetric journal meta/rcr frequency analysis
│   ├───timeline.R                 Produces the RCR case study timeline in the paper
│   ├───wget2jsonld.py             Helper script to convert wget output to jsonld
│   └───wordcloud.R                Produces word cloud from cited abstracts
├───LICENSE                        The LICENSE file
├───README.md                      What you are looking at
├───environment.osx.yaml           OSX pinned Conda depenencies
├───environment.unpinned.yaml      Unpinned Conda depenencies
└───ro-crate-metadata.jsonld       RO Crate config
```
<!--tree_placeholder-->

## Examples of RCR metadata standards

In this table we provide links to the authoritative publications and homepages for these metadata standards, as well as examples we have collected. `Schema` refers the parent structure this standard conforms to, if any. `Encoding` refers to the markup format used. Note that for schemas such as OWL, which relies on RDF subject–predicate–object triplets, the encoding could be one of at least *seven* serialization types (RDF/XML, RDF/JSON, JSON-LD, Turtle, N-Triples, N-Quads, N3), so the listed encoding is somewhat arbitrary. For other standards, such as DICOM, the encoding is a custom binary although there are numerous export format and even attempts to serialize JSON within DICOM.

[:books:] Publication  [:house:] Homepage  [:clipboard:] Example
<!--standards_begin-->
|Standard                                                                                                                                                                                         |Layer       |Domain             |Encoding |Schema    |Description                                                                    |
|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-----------|:------------------|:--------|:---------|:------------------------------------------------------------------------------|
|CellML&nbsp;[:books:](https://doi.org/10.1177/0037549703040939)&nbsp;[:house:](https://www.cellml.org/)&nbsp;[:clipboard:](data/examples/cellml_saucerman_brunton_michailova_mcculloch_2003.xml) |Input       |Biology            |XML      |RDF       |mathematical models for biology                                                                               | 
|CIF2&nbsp;[:books:](https://doi.org/10.1107/s1600576715021871)&nbsp;[:house:](https://www.iucr.org/resources/cif/cif2)&nbsp;                                                                     |Input       |Crystallography    |Custom   |          |atomic structure                                                                               |
|DATS&nbsp;[:books:](https://doi.org/10.1093/gigascience/giz165)&nbsp;[:house:](https://github.com/datatagsuite)&nbsp;                                                                            |Input       |Biomedical         |JSON     |          |desc metadata (people, org, repo) for data pubs                                                                                |
|DICOM&nbsp;[:books:](https://doi.org/10.1148/radiographics.12.2.1561424)&nbsp;[:house:](https://www.dicomstandard.org/)&nbsp;[:clipboard:](data/examples/dicom)                                  |Input       |Images             |Custom   |Key-Value |standard for all medical imaging                                                                               |
|EML&nbsp;[:books:](https://doi.org/10.1016/j.ecoinf.2005.08.004)&nbsp;[:house:](https://eml.ecoinformatics.org/)&nbsp;                                                                           |Input       |Ecology            |XML      |          |eco support for geo, species, pubs used in <a href="https://knb.ecoinformatics.org/">KNB</a>                                                                               |
|FAANG&nbsp;&nbsp;[:house:](https://www.ebi.ac.uk/vg/faang)&nbsp;                                                                                                                                 |Input       |Specimens          |Tabular  |          |                                                                               |
|GBIF&nbsp;[:books:](https://doi.org/10.1371/journal.pone.0102623)&nbsp;[:house:](https://www.gbif.org/)&nbsp;                                                                                    |Input       |Biodiversity       |JSON     |          |                                                                               |
|GO&nbsp;[:books:](https://doi.org/10.1038/75556)&nbsp;[:house:](http://geneontology.org/)&nbsp;                                                                                                  |Input       |Genes              |XML      |          |                                                                               |
|ISO/TC 276&nbsp;&nbsp;[:house:](https://www.iso.org/committee/4514241.html)&nbsp;                                                                                                                |Input       |Biotechnology      |         |          |                                                                               |
|MIAME&nbsp;[:books:](https://doi.org/10.1038/ng1201-365)&nbsp;[:house:](https://www.ncbi.nlm.nih.gov/geo/info/MIAME.html)&nbsp;                                                                  |Input       |Microarrays        |XML      |          |                                                                               |
|NetCDF&nbsp;[:books:](https://doi.org/10.1109/38.56302)&nbsp;[:house:](https://www.unidata.ucar.edu/software/netcdf/)&nbsp;                                                                      |Input       |Arrays             |         |          |                                                                               |
|OGC&nbsp;&nbsp;[:house:](https://www.ogc.org/)&nbsp;                                                                                                                                             |Input       |Geospatial         |         |          |                                                                               |
|ThermoML&nbsp;[:books:](https://doi.org/10.1021/je034088i)&nbsp;[:house:](https://www.nist.gov/mml/acmd/trc/thermoml)&nbsp;                                                                      |Input       |Compounds          |XML      |          |                                                                               |
|CRAN&nbsp;&nbsp;[:house:](http://cran.r-project.org/)&nbsp;                                                                                                                                      |Tools       |R packages         |         |          |                                                                               |
|Conda&nbsp;&nbsp;[:house:](https://docs.conda.io/)&nbsp;                                                                                                                                         |Tools       |Dependencies       |         |          |                                                                               |
|pip setup.cfg&nbsp;&nbsp;[:house:](https://pypi.org/project/pip/)&nbsp;                                                                                                                          |Tools       |Python modules     |CFG      |Key-Value |Python cfg files have headers and key-value pairs similar to Windows INI files |
|EDAM&nbsp;[:books:](https://doi.org/10.1093/bioinformatics/btt113)&nbsp;[:house:](http://edamontology.org/)&nbsp;                                                                                |Tools       |Bfx data           |         |          |                                                                               |
|CodeMeta&nbsp;&nbsp;[:house:](https://codemeta.github.io/)&nbsp;                                                                                                                                 |Tools       |Source code        |         |          |                                                                               |
|Biotoolsxsd&nbsp;[:books:](https://doi.org/10.1093/nar/gkv1116)&nbsp;[:house:](https://github.com/unioslo/biotoolsxsd)&nbsp;                                                                     |Tools       |Bfx software       |XML      |          |                                                                               |
|DOAP&nbsp;&nbsp;[:house:](https://github.com/ewilderj/doap)&nbsp;                                                                                                                                |Tools       |Software           |XML      |          |                                                                               |
|ontosoft&nbsp;&nbsp;[:house:](https://www.ontosoft.org/)&nbsp;                                                                                                                                   |Tools       |Geo software       |         |          |                                                                               |
|SWO&nbsp;[:books:](https://doi.org/10.1186/2041-1480-5-25)&nbsp;[:house:](https://www.ebi.ac.uk/ols/ontologies/swo)&nbsp;                                                                        |Tools       |Bfx Software       |         |          |                                                                               |
|OBCS&nbsp;[:books:](https://doi.org/10.1186/s13326-016-0100-2)&nbsp;[:house:](http://www.obofoundry.org/ontology/obcs.html)&nbsp;                                                                |Reports     |Biostatistics      |         |          |                                                                               |
|STATO&nbsp;&nbsp;[:house:](http://stato-ontology.org/)&nbsp;                                                                                                                                     |Reports     |Statistics         |         |          |                                                                               |
|SDMX&nbsp;&nbsp;[:house:](https://sdmx.org/)&nbsp;                                                                                                                                               |Reports     |Statistics         |JSON     |          |                                                                               |
|DDI&nbsp;&nbsp;[:house:](https://ddialliance.org/)&nbsp;                                                                                                                                         |Reports     |Studies            |XML      |          |                                                                               |
|MEX&nbsp;[:books:](https://doi.org/10.1145/2814864.2814883)&nbsp;[:house:](http://aksw.org/Projects/MEX.html)&nbsp;                                                                              |Reports     |ML                 |XML      |          |                                                                               |
|MLSchema&nbsp;&nbsp;[:house:](https://github.com/ML-Schema/)&nbsp;                                                                                                                               |Reports     |ML                 |         |          |                                                                               |
|MLFlow&nbsp;&nbsp;[:house:](https://mlflow.org/)&nbsp;                                                                                                                                           |Reports     |ML                 |         |          |                                                                               |
|Rmd&nbsp;&nbsp;[:house:](https://rmarkdown.rstudio.com/)&nbsp;                                                                                                                                   |Reports     |Docs               |YAML     |Key-Value |                                                                               |
|CWL&nbsp;[:books:](https://doi.org/10.6084/m9.figshare.3115156.v2)&nbsp;[:house:](https://www.commonwl.org/)&nbsp;                                                                               |Tools, Pipelines   |                   |YAML     | [Schema Salad](https://www.commonwl.org/v1.1/SchemaSalad.html) | Common Workflow Language specifies how to invoke a command line tool or a pipeline of such tools  |
|CWLProv&nbsp;[:books:](https://doi.org/10.1093/gigascience/giz095)&nbsp;[:house:](https://github.com/common-workflow-language/cwlprov)&nbsp;                                                     |Pipelines   |                   | YAML, JSON, XML        |          | BagIt of Research Object folder containing manifest (JSON-LD), CWL (YAML), PROV (JSON, XML, RDF)                                                                              |
|RO-Crate&nbsp;&nbsp;[:house:](https://w3id.org/ro/crate/1.0)&nbsp;                                                                                                              |Input, Pipelines, Publication |                   | JSON-LD     | RDF, schema.org    | RO-Crate is a profile of using [schema.org](http://schema.org/) to annotate any collections of research data and their real-life origins |
|RO&nbsp;&nbsp;[:house:](http://www.researchobject.org/)&nbsp;                                                                                                                                    |Pipelines   |                   | Turtle, JSON-LD, XML | OWL  |                                                                               |
|WICUS&nbsp;&nbsp;[:house:](http://vocab.linkeddata.es/wicus/wicus/)&nbsp;                                                                                                                        |Pipelines   |                   |         |          |                                                                               |
|OPM&nbsp;&nbsp;[:house:](https://openprovenance.org/opm/)&nbsp;                                                                                                                                  |Pipelines   |                   |         |          |                                                                               |
|PROV-O&nbsp;&nbsp;[:house:](https://www.w3.org/TR/prov-o/)&nbsp;                                                                                                                                 |Pipelines   |                   |         | OWL         |  Several [PROV serializations](http://www.w3.org/TR/prov-overview/) exists; PROV-O is in OWL, which again has many serializations including the RDF syntaxes  |
|ReproZIp&nbsp;&nbsp;[:house:](https://www.reprozip.org/)&nbsp;                                                                                                                                   |Pipelines   |                   |         |          |                                                                               |
|ProvOne&nbsp;&nbsp;[:house:](https://purl.dataone.org/provone-v1-dev)&nbsp;                                                                                                                      |Pipelines   |                   |         |          |                                                                               |
|WES&nbsp;&nbsp;&nbsp;                                                                                                                                                                            |Pipelines   |                   |         |          |                                                                               |
|BagIt&nbsp;&nbsp;[:house:](https://tools.ietf.org/html/rfc8493)&nbsp;                                                                                                                            |Input, Pipelines   |                   |  Text   | Key-Value | For long-term perservation and availability BagIt specifies a fixed folder structure of _payload files_, their checksums and other metadata _tag files_. _Bags_ can be archived as zip, tar, etc or remain folders |
|BCO&nbsp;&nbsp;&nbsp;                                                                                                                                                                            |Pipelines   |                   |         |          |                                                                               |
|ERC&nbsp;[:books:](https://doi.org/10.5281/zenodo.2203844)&nbsp;[:house:](https://o2r.info/erc-spec/)&nbsp;                                                                                      |Pipelines   |Research Compendia |YAML     |Key-Value |                                                                               |
|BEL&nbsp;&nbsp;&nbsp;                                                                                                                                                                            |Publication |                   |         |          |                                                                               |
|DC&nbsp;&nbsp;&nbsp;                                                                                                                                                                             |Publication |                   |         |          |                                                                               |
|JATS&nbsp;&nbsp;[:house:](https://jats.nlm.nih.gov/)&nbsp;                                                                                                                                       |Publication |Articles           |XML      |Tags DTD  |                                                                               |
|ONIX&nbsp;&nbsp;&nbsp;                                                                                                                                                                           |Publication |                   |         |          |                                                                               |
|MeSH&nbsp;&nbsp;&nbsp;                                                                                                                                                                           |Publication |                   |         |          |                                                                               |
|LCSH&nbsp;&nbsp;&nbsp;                                                                                                                                                                           |Publication |                   |         |          |                                                                               |
|MP&nbsp;[:books:](https://doi.org/10.1186/2041-1480-5-28)&nbsp;&nbsp;                                                                                                                            |Publication |Micropublications  |         |OWL       |                                                                               |
|Open PHACTS&nbsp;[:books:](https://doi.org/10.1016/j.drudis.2012.05.016)&nbsp;[:house:](https://www.openphacts.org/)&nbsp;                                                                       |Publication |Drugs              |         |RDF       |                                                                               |
|SWAN&nbsp;[:books:](https://doi.org/10.1016/j.jbi.2008.04.010)&nbsp;&nbsp;                                                                                                                       |Publication |Neuromedicine      |         |          |                                                                               |
|SPAR&nbsp;&nbsp;[:house:](http://www.sparontologies.net/)&nbsp;                                                                                                                                  |Publication |Publishing         |         |OWL       |                                                                               |
|PWO&nbsp;[:books:](https://doi.org/10.3233/SW-160230)&nbsp;&nbsp;                                                                                                                                |Publication |Publishing         |         |          |                                                                               |
|PAV&nbsp;[:books:](https://doi.org/10.1186/2041-1480-4-37)&nbsp;&nbsp;                                                                                                                           |Publication |Authorship         |  | OWL       |                                                                               |
|Manubot&nbsp;&nbsp;&nbsp;[:clipboard:](data/examples/manubot_metadata.yaml)                                                                                                                      |Publication |Publishing         |YAML     |          |                                                                               |
|ReScience&nbsp;&nbsp;&nbsp;[:clipboard:](data/examples/rescience_metadata.yaml)                                                                                                                  |Publication |Publishing         |YAML     |          |                                                                               |
|PandocScholar&nbsp;&nbsp;&nbsp;[:clipboard:](data/examples/pandocscholar_metadata.yaml)                                                                                                          |Publication |Publishing         |YAML     |          |                                                                               |
<!--standards_end-->

RDF vs OWL
https://stackoverflow.com/questions/1740341/what-is-the-difference-between-rdf-and-owl

## How to generate the timeline for this article

Install [cwltool](https://github.com/common-workflow-language/cwltool)
```
pip install cwltool
cwltool src/cwl/tools/timeline.cwl --reportfile timeline.html
```

## Contribute

Contributions welcome!

## License

[![CC0](http://mirrors.creativecommons.org/presskit/buttons/88x31/svg/cc-zero.svg)](https://creativecommons.org/publicdomain/zero/1.0/)








