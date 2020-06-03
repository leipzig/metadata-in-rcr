# The Role of Metadata in Reproducible Computational Research
This is a supplemental resource to Leipzig et al. "The Role of Metadata in Reproducible Computational Research"

## Organization
```
├───data/
│   ├───examples/                  Examples of metadata standards
│   ├───lens/                      Search exports for scimetric journal analysis
│   └───standards.tsv.txt          Raw standards table
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

In this table we provide links to the authoritative publications and homepages for these metadata standards, as well as examples we have collected. `Schema` refers the parent structure this standard conforms to, if any. `Encoding` refers to the markup fornat used. Note that for schemas such as OWL, which relies on RDF subject–predicate–object triplets, the encoding could be one of at least *seven* serialization types (RDF/XML, RDF/JSON, JSON-LD, Turtle, N-Triples, N-Quads, N3), so the listed encoding is somewhat arbitrary. For other standards, such as DICOM, the encoding is a custom binary although there are numerous export format and even attempts to serialize JSON within DICOM.

<table id="standards">
			<tbody>
				<tr>
					<td>
							Standard
					</td>
					<td>
							Category
					</td>
					<td>
							Publication
					</td>
					<td>
							Site
					</td>
					<td>
							Example
					</td>
					<td>
							Schema
					</td>
					<td>
							Encoding
					</td>
				</tr>
				<!--standards_placeholder-->
</table>

RDF vs OWL
https://stackoverflow.com/questions/1740341/what-is-the-difference-between-rdf-and-owl

## How to generate figures for this article

`src/
```
TODO: CWL workflow, Dockerfile, Conda reqs
```

## Contribute

Contributions welcome!

## License

[![CC0](http://mirrors.creativecommons.org/presskit/buttons/88x31/svg/cc-zero.svg)](https://creativecommons.org/publicdomain/zero/1.0/)