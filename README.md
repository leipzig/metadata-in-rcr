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


<!--standards_begin-->
|Standard      |Layer       |Domain             |Publication                        |Site                                                |Example                                                |Encoding |Schema    |Description                                                                    |
|:-------------|:-----------|:------------------|:----------------------------------|:---------------------------------------------------|:------------------------------------------------------|:--------|:---------|:------------------------------------------------------------------------------|
|CellML        |Input       |Biology            |10.1177/0037549703040939           |https://www.cellml.org/                             |cellml_saucerman_brunton_michailova_mcculloch_2003.xml |XML      |          |                                                                               |
|CIF2          |Input       |Crystallography    |10.1107/s1600576715021871          |https://www.iucr.org/resources/cif/cif2             |                                                       |Custom   |          |                                                                               |
|DATS          |Input       |Biomedical         |10.1093/gigascience/giz165         |https://github.com/datatagsuite                     |                                                       |JSON     |          |                                                                               |
|DICOM         |Input       |Images             |10.1148/radiographics.12.2.1561424 |https://www.dicomstandard.org/                      |dicom                                                  |Custom   |Key-Value |                                                                               |
|EML           |Input       |Ecology            |10.1016/j.ecoinf.2005.08.004       |https://eml.ecoinformatics.org/                     |                                                       |XML      |          |                                                                               |
|FAANG         |Input       |Specimens          |                                   |https://www.ebi.ac.uk/vg/faang                      |                                                       |Tabular  |          |                                                                               |
|GBIF          |Input       |Biodiversity       |10.1371/journal.pone.0102623       |https://www.gbif.org/                               |                                                       |JSON     |          |                                                                               |
|GO            |Input       |Genes              |10.1038/75556                      |http://geneontology.org/                            |                                                       |XML      |          |                                                                               |
|ISO/TC 276    |Input       |Biotechnology      |                                   |https://www.iso.org/committee/4514241.html          |                                                       |         |          |                                                                               |
|MIAME         |Input       |Microarrays        |10.1038/ng1201-365                 |https://www.ncbi.nlm.nih.gov/geo/info/MIAME.html    |                                                       |XML      |          |                                                                               |
|NetCDF        |Input       |Arrays             |10.1109/38.56302                   |https://www.unidata.ucar.edu/software/netcdf/       |                                                       |         |          |                                                                               |
|OGC           |Input       |Geospatial         |                                   |https://www.ogc.org/                                |                                                       |         |          |                                                                               |
|ThermoML      |Input       |Compounds          |10.1021/je034088i                  |https://www.nist.gov/mml/acmd/trc/thermoml          |                                                       |XML      |          |                                                                               |
|CRAN          |Tools       |R packages         |                                   |http://cran.r-project.org/                          |                                                       |         |          |                                                                               |
|Conda         |Tools       |Dependencies       |                                   |https://docs.conda.io/                              |                                                       |         |          |                                                                               |
|pip setup.cfg |Tools       |Python modules     |                                   |https://pypi.org/project/pip/                       |                                                       |CFG      |Key-Value |Python cfg files have headers and key-value pairs similar to Windows INI files |
|EDAM          |Tools       |Bfx data           |10.1093/bioinformatics/btt113      |http://edamontology.org/                            |                                                       |         |          |                                                                               |
|CodeMeta      |Tools       |Source code        |                                   |https://codemeta.github.io/                         |                                                       |         |          |                                                                               |
|Biotoolsxsd   |Tools       |Bfx software       |10.1093/nar/gkv1116                |https://github.com/unioslo/biotoolsxsd              |                                                       |XML      |          |                                                                               |
|DOAP          |Tools       |Software           |                                   |https://github.com/ewilderj/doap                    |                                                       |XML      |          |                                                                               |
|ontosoft      |Tools       |Geo software       |                                   |https://www.ontosoft.org/                           |                                                       |         |          |                                                                               |
|SWO           |Tools       |Bfx Software       |10.1186/2041-1480-5-25             |https://www.ebi.ac.uk/ols/ontologies/swo            |                                                       |         |          |                                                                               |
|OBCS          |Reports     |Biostatistics      |10.1186/s13326-016-0100-2          |http://www.obofoundry.org/ontology/obcs.html        |                                                       |         |          |                                                                               |
|STATO         |Reports     |Statistics         |                                   |http://stato-ontology.org/                          |                                                       |         |          |                                                                               |
|SDMX          |Reports     |Statistics         |                                   |https://sdmx.org/                                   |                                                       |JSON     |          |                                                                               |
|DDI           |Reports     |Studies            |                                   |https://ddialliance.org/                            |                                                       |XML      |          |                                                                               |
|MEX           |Reports     |ML                 |10.1145/2814864.2814883            |http://aksw.org/Projects/MEX.html                   |                                                       |XML      |          |                                                                               |
|MLSchema      |Reports     |ML                 |                                   |https://github.com/ML-Schema/                       |                                                       |         |          |                                                                               |
|MLFlow        |Reports     |ML                 |                                   |https://mlflow.org/                                 |                                                       |         |          |                                                                               |
|Rmd           |Reports     |Docs               |                                   |https://rmarkdown.rstudio.com/                      |                                                       |YAML     |Key-Value |                                                                               |
|CWL           |Pipelines   |                   |10.6084/m9.figshare.3115156.v2     |https://www.commonwl.org/                           |                                                       |YAML     |          |                                                                               |
|CWLProv       |Pipelines   |                   |10.1093/gigascience/giz095         |https://github.com/common-workflow-language/cwlprov |                                                       |         |          |                                                                               |
|RO-Crate      |Pipelines   |                   |                                   |https://researchobject.github.io/ro-crate/1.0/      |                                                       |         |          |                                                                               |
|RO            |Pipelines   |                   |                                   |http://www.researchobject.org/                      |                                                       |         |          |                                                                               |
|WICUS         |Pipelines   |                   |                                   |http://vocab.linkeddata.es/wicus/wicus/             |                                                       |         |          |                                                                               |
|OPM           |Pipelines   |                   |                                   |https://openprovenance.org/opm/                     |                                                       |         |          |                                                                               |
|PROV-O        |Pipelines   |                   |                                   |https://www.w3.org/TR/prov-o/                       |                                                       |         |          |                                                                               |
|ReproZIp      |Pipelines   |                   |                                   |https://www.reprozip.org/                           |                                                       |         |          |                                                                               |
|ProvOne       |Pipelines   |                   |                                   |https://purl.dataone.org/provone-v1-dev             |                                                       |         |          |                                                                               |
|WES           |Pipelines   |                   |                                   |                                                    |                                                       |         |          |                                                                               |
|BagIt         |Pipelines   |                   |                                   |https://tools.ietf.org/html/rfc8493                 |                                                       |         |          |                                                                               |
|BCO           |Pipelines   |                   |                                   |                                                    |                                                       |         |          |                                                                               |
|ERC           |Pipelines   |Research Compendia |10.5281/zenodo.2203844             |https://o2r.info/erc-spec/                          |                                                       |YAML     |Key-Value |                                                                               |
|BEL           |Publication |                   |                                   |                                                    |                                                       |         |          |                                                                               |
|DC            |Publication |                   |                                   |                                                    |                                                       |         |          |                                                                               |
|JATS          |Publication |Articles           |                                   |https://jats.nlm.nih.gov/                           |                                                       |XML      |Tags DTD  |                                                                               |
|ONIX          |Publication |                   |                                   |                                                    |                                                       |         |          |                                                                               |
|MeSH          |Publication |                   |                                   |                                                    |                                                       |         |          |                                                                               |
|LCSH          |Publication |                   |                                   |                                                    |                                                       |         |          |                                                                               |
|MP            |Publication |Micropublications  |10.1186/2041-1480-5-28             |                                                    |                                                       |         |OWL       |                                                                               |
|Open PHACTS   |Publication |Drugs              |10.1016/j.drudis.2012.05.016       |https://www.openphacts.org/                         |                                                       |         |RDF/XML   |                                                                               |
|SWAN          |Publication |Neuromedicine      |10.1016/j.jbi.2008.04.010          |                                                    |                                                       |         |          |                                                                               |
|SPAR          |Publication |Publishing         |                                   |http://www.sparontologies.net/                      |                                                       |         |OWL       |                                                                               |
|PWO           |Publication |Publishing         |10.3233/SW-160230                  |                                                    |                                                       |         |          |                                                                               |
|PAV           |Publication |Authorship         |10.1186/2041-1480-4-37             |                                                    |                                                       |XML      |RDF/XML   |                                                                               |
<!--standards_end-->

RDF vs OWL
https://stackoverflow.com/questions/1740341/what-is-the-difference-between-rdf-and-owl

## How to generate figures for this article

```
TODO: CWL workflow, Dockerfile, Conda reqs
```

## Contribute

Contributions welcome!

## License

[![CC0](http://mirrors.creativecommons.org/presskit/buttons/88x31/svg/cc-zero.svg)](https://creativecommons.org/publicdomain/zero/1.0/)

