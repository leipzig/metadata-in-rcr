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
|Standard                                                                                                                                                                          |Layer       |Domain             |Encoding |Schema    |Description                                                                    |
|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-----------|:------------------|:--------|:---------|:------------------------------------------------------------------------------|
|CellML [:books:](https://doi.org/10.1177/0037549703040939) [:house:](https://www.cellml.org/) [:clipboard:](data/examples/cellml_saucerman_brunton_michailova_mcculloch_2003.xml) |Input       |Biology            |XML      |          |                                                                               |
|CIF2 [:books:](https://doi.org/10.1107/s1600576715021871) [:house:](https://www.iucr.org/resources/cif/cif2)                                                                      |Input       |Crystallography    |Custom   |          |                                                                               |
|DATS [:books:](https://doi.org/10.1093/gigascience/giz165) [:house:](https://github.com/datatagsuite)                                                                             |Input       |Biomedical         |JSON     |          |                                                                               |
|DICOM [:books:](https://doi.org/10.1148/radiographics.12.2.1561424) [:house:](https://www.dicomstandard.org/) [:clipboard:](data/examples/dicom)                                  |Input       |Images             |Custom   |Key-Value |                                                                               |
|EML [:books:](https://doi.org/10.1016/j.ecoinf.2005.08.004) [:house:](https://eml.ecoinformatics.org/)                                                                            |Input       |Ecology            |XML      |          |                                                                               |
|FAANG  [:house:](https://www.ebi.ac.uk/vg/faang)                                                                                                                                  |Input       |Specimens          |Tabular  |          |                                                                               |
|GBIF [:books:](https://doi.org/10.1371/journal.pone.0102623) [:house:](https://www.gbif.org/)                                                                                     |Input       |Biodiversity       |JSON     |          |                                                                               |
|GO [:books:](https://doi.org/10.1038/75556) [:house:](http://geneontology.org/)                                                                                                   |Input       |Genes              |XML      |          |                                                                               |
|ISO/TC 276  [:house:](https://www.iso.org/committee/4514241.html)                                                                                                                 |Input       |Biotechnology      |         |          |                                                                               |
|MIAME [:books:](https://doi.org/10.1038/ng1201-365) [:house:](https://www.ncbi.nlm.nih.gov/geo/info/MIAME.html)                                                                   |Input       |Microarrays        |XML      |          |                                                                               |
|NetCDF [:books:](https://doi.org/10.1109/38.56302) [:house:](https://www.unidata.ucar.edu/software/netcdf/)                                                                       |Input       |Arrays             |         |          |                                                                               |
|OGC  [:house:](https://www.ogc.org/)                                                                                                                                              |Input       |Geospatial         |         |          |                                                                               |
|ThermoML [:books:](https://doi.org/10.1021/je034088i) [:house:](https://www.nist.gov/mml/acmd/trc/thermoml)                                                                       |Input       |Compounds          |XML      |          |                                                                               |
|CRAN  [:house:](http://cran.r-project.org/)                                                                                                                                       |Tools       |R packages         |         |          |                                                                               |
|Conda  [:house:](https://docs.conda.io/)                                                                                                                                          |Tools       |Dependencies       |         |          |                                                                               |
|pip setup.cfg  [:house:](https://pypi.org/project/pip/)                                                                                                                           |Tools       |Python modules     |CFG      |Key-Value |Python cfg files have headers and key-value pairs similar to Windows INI files |
|EDAM [:books:](https://doi.org/10.1093/bioinformatics/btt113) [:house:](http://edamontology.org/)                                                                                 |Tools       |Bfx data           |         |          |                                                                               |
|CodeMeta  [:house:](https://codemeta.github.io/)                                                                                                                                  |Tools       |Source code        |         |          |                                                                               |
|Biotoolsxsd [:books:](https://doi.org/10.1093/nar/gkv1116) [:house:](https://github.com/unioslo/biotoolsxsd)                                                                      |Tools       |Bfx software       |XML      |          |                                                                               |
|DOAP  [:house:](https://github.com/ewilderj/doap)                                                                                                                                 |Tools       |Software           |XML      |          |                                                                               |
|ontosoft  [:house:](https://www.ontosoft.org/)                                                                                                                                    |Tools       |Geo software       |         |          |                                                                               |
|SWO [:books:](https://doi.org/10.1186/2041-1480-5-25) [:house:](https://www.ebi.ac.uk/ols/ontologies/swo)                                                                         |Tools       |Bfx Software       |         |          |                                                                               |
|OBCS [:books:](https://doi.org/10.1186/s13326-016-0100-2) [:house:](http://www.obofoundry.org/ontology/obcs.html)                                                                 |Reports     |Biostatistics      |         |          |                                                                               |
|STATO  [:house:](http://stato-ontology.org/)                                                                                                                                      |Reports     |Statistics         |         |          |                                                                               |
|SDMX  [:house:](https://sdmx.org/)                                                                                                                                                |Reports     |Statistics         |JSON     |          |                                                                               |
|DDI  [:house:](https://ddialliance.org/)                                                                                                                                          |Reports     |Studies            |XML      |          |                                                                               |
|MEX [:books:](https://doi.org/10.1145/2814864.2814883) [:house:](http://aksw.org/Projects/MEX.html)                                                                               |Reports     |ML                 |XML      |          |                                                                               |
|MLSchema  [:house:](https://github.com/ML-Schema/)                                                                                                                                |Reports     |ML                 |         |          |                                                                               |
|MLFlow  [:house:](https://mlflow.org/)                                                                                                                                            |Reports     |ML                 |         |          |                                                                               |
|Rmd  [:house:](https://rmarkdown.rstudio.com/)                                                                                                                                    |Reports     |Docs               |YAML     |Key-Value |                                                                               |
|CWL [:books:](https://doi.org/10.6084/m9.figshare.3115156.v2) [:house:](https://www.commonwl.org/)                                                                                |Pipelines   |                   |YAML     |          |                                                                               |
|CWLProv [:books:](https://doi.org/10.1093/gigascience/giz095) [:house:](https://github.com/common-workflow-language/cwlprov)                                                      |Pipelines   |                   |         |          |                                                                               |
|RO-Crate  [:house:](https://researchobject.github.io/ro-crate/1.0/)                                                                                                               |Pipelines   |                   |         |          |                                                                               |
|RO  [:house:](http://www.researchobject.org/)                                                                                                                                     |Pipelines   |                   |         |          |                                                                               |
|WICUS  [:house:](http://vocab.linkeddata.es/wicus/wicus/)                                                                                                                         |Pipelines   |                   |         |          |                                                                               |
|OPM  [:house:](https://openprovenance.org/opm/)                                                                                                                                   |Pipelines   |                   |         |          |                                                                               |
|PROV-O  [:house:](https://www.w3.org/TR/prov-o/)                                                                                                                                  |Pipelines   |                   |         |          |                                                                               |
|ReproZIp  [:house:](https://www.reprozip.org/)                                                                                                                                    |Pipelines   |                   |         |          |                                                                               |
|ProvOne  [:house:](https://purl.dataone.org/provone-v1-dev)                                                                                                                       |Pipelines   |                   |         |          |                                                                               |
|WES                                                                                                                                                                               |Pipelines   |                   |         |          |                                                                               |
|BagIt  [:house:](https://tools.ietf.org/html/rfc8493)                                                                                                                             |Pipelines   |                   |         |          |                                                                               |
|BCO                                                                                                                                                                               |Pipelines   |                   |         |          |                                                                               |
|ERC [:books:](https://doi.org/10.5281/zenodo.2203844) [:house:](https://o2r.info/erc-spec/)                                                                                       |Pipelines   |Research Compendia |YAML     |Key-Value |                                                                               |
|BEL                                                                                                                                                                               |Publication |                   |         |          |                                                                               |
|DC                                                                                                                                                                                |Publication |                   |         |          |                                                                               |
|JATS  [:house:](https://jats.nlm.nih.gov/)                                                                                                                                        |Publication |Articles           |XML      |Tags DTD  |                                                                               |
|ONIX                                                                                                                                                                              |Publication |                   |         |          |                                                                               |
|MeSH                                                                                                                                                                              |Publication |                   |         |          |                                                                               |
|LCSH                                                                                                                                                                              |Publication |                   |         |          |                                                                               |
|MP [:books:](https://doi.org/10.1186/2041-1480-5-28)                                                                                                                              |Publication |Micropublications  |         |OWL       |                                                                               |
|Open PHACTS [:books:](https://doi.org/10.1016/j.drudis.2012.05.016) [:house:](https://www.openphacts.org/)                                                                        |Publication |Drugs              |         |RDF/XML   |                                                                               |
|SWAN [:books:](https://doi.org/10.1016/j.jbi.2008.04.010)                                                                                                                         |Publication |Neuromedicine      |         |          |                                                                               |
|SPAR  [:house:](http://www.sparontologies.net/)                                                                                                                                   |Publication |Publishing         |         |OWL       |                                                                               |
|PWO [:books:](https://doi.org/10.3233/SW-160230)                                                                                                                                  |Publication |Publishing         |         |          |                                                                               |
|PAV [:books:](https://doi.org/10.1186/2041-1480-4-37)                                                                                                                             |Publication |Authorship         |XML      |RDF/XML   |                                                                               |
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


