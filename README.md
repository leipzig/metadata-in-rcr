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
|Standard                                                                                                                                                                                         |Layer       |Domain             |Encoding |Schema    |Description                                                                    |
|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:-----------|:------------------|:--------|:---------|:------------------------------------------------------------------------------|
|<nobr> CellML [:books:](https://doi.org/10.1177/0037549703040939) [:house:](https://www.cellml.org/) [:clipboard:](data/examples/cellml_saucerman_brunton_michailova_mcculloch_2003.xml) </nobr> |Input       |Biology            |XML      |          |                                                                               |
|<nobr> CIF2 [:books:](https://doi.org/10.1107/s1600576715021871) [:house:](https://www.iucr.org/resources/cif/cif2)  </nobr>                                                                     |Input       |Crystallography    |Custom   |          |                                                                               |
|<nobr> DATS [:books:](https://doi.org/10.1093/gigascience/giz165) [:house:](https://github.com/datatagsuite)  </nobr>                                                                            |Input       |Biomedical         |JSON     |          |                                                                               |
|<nobr> DICOM [:books:](https://doi.org/10.1148/radiographics.12.2.1561424) [:house:](https://www.dicomstandard.org/) [:clipboard:](data/examples/dicom) </nobr>                                  |Input       |Images             |Custom   |Key-Value |                                                                               |
|<nobr> EML [:books:](https://doi.org/10.1016/j.ecoinf.2005.08.004) [:house:](https://eml.ecoinformatics.org/)  </nobr>                                                                           |Input       |Ecology            |XML      |          |                                                                               |
|<nobr> FAANG  [:house:](https://www.ebi.ac.uk/vg/faang)  </nobr>                                                                                                                                 |Input       |Specimens          |Tabular  |          |                                                                               |
|<nobr> GBIF [:books:](https://doi.org/10.1371/journal.pone.0102623) [:house:](https://www.gbif.org/)  </nobr>                                                                                    |Input       |Biodiversity       |JSON     |          |                                                                               |
|<nobr> GO [:books:](https://doi.org/10.1038/75556) [:house:](http://geneontology.org/)  </nobr>                                                                                                  |Input       |Genes              |XML      |          |                                                                               |
|<nobr> ISO/TC 276  [:house:](https://www.iso.org/committee/4514241.html)  </nobr>                                                                                                                |Input       |Biotechnology      |         |          |                                                                               |
|<nobr> MIAME [:books:](https://doi.org/10.1038/ng1201-365) [:house:](https://www.ncbi.nlm.nih.gov/geo/info/MIAME.html)  </nobr>                                                                  |Input       |Microarrays        |XML      |          |                                                                               |
|<nobr> NetCDF [:books:](https://doi.org/10.1109/38.56302) [:house:](https://www.unidata.ucar.edu/software/netcdf/)  </nobr>                                                                      |Input       |Arrays             |         |          |                                                                               |
|<nobr> OGC  [:house:](https://www.ogc.org/)  </nobr>                                                                                                                                             |Input       |Geospatial         |         |          |                                                                               |
|<nobr> ThermoML [:books:](https://doi.org/10.1021/je034088i) [:house:](https://www.nist.gov/mml/acmd/trc/thermoml)  </nobr>                                                                      |Input       |Compounds          |XML      |          |                                                                               |
|<nobr> CRAN  [:house:](http://cran.r-project.org/)  </nobr>                                                                                                                                      |Tools       |R packages         |         |          |                                                                               |
|<nobr> Conda  [:house:](https://docs.conda.io/)  </nobr>                                                                                                                                         |Tools       |Dependencies       |         |          |                                                                               |
|<nobr> pip setup.cfg  [:house:](https://pypi.org/project/pip/)  </nobr>                                                                                                                          |Tools       |Python modules     |CFG      |Key-Value |Python cfg files have headers and key-value pairs similar to Windows INI files |
|<nobr> EDAM [:books:](https://doi.org/10.1093/bioinformatics/btt113) [:house:](http://edamontology.org/)  </nobr>                                                                                |Tools       |Bfx data           |         |          |                                                                               |
|<nobr> CodeMeta  [:house:](https://codemeta.github.io/)  </nobr>                                                                                                                                 |Tools       |Source code        |         |          |                                                                               |
|<nobr> Biotoolsxsd [:books:](https://doi.org/10.1093/nar/gkv1116) [:house:](https://github.com/unioslo/biotoolsxsd)  </nobr>                                                                     |Tools       |Bfx software       |XML      |          |                                                                               |
|<nobr> DOAP  [:house:](https://github.com/ewilderj/doap)  </nobr>                                                                                                                                |Tools       |Software           |XML      |          |                                                                               |
|<nobr> ontosoft  [:house:](https://www.ontosoft.org/)  </nobr>                                                                                                                                   |Tools       |Geo software       |         |          |                                                                               |
|<nobr> SWO [:books:](https://doi.org/10.1186/2041-1480-5-25) [:house:](https://www.ebi.ac.uk/ols/ontologies/swo)  </nobr>                                                                        |Tools       |Bfx Software       |         |          |                                                                               |
|<nobr> OBCS [:books:](https://doi.org/10.1186/s13326-016-0100-2) [:house:](http://www.obofoundry.org/ontology/obcs.html)  </nobr>                                                                |Reports     |Biostatistics      |         |          |                                                                               |
|<nobr> STATO  [:house:](http://stato-ontology.org/)  </nobr>                                                                                                                                     |Reports     |Statistics         |         |          |                                                                               |
|<nobr> SDMX  [:house:](https://sdmx.org/)  </nobr>                                                                                                                                               |Reports     |Statistics         |JSON     |          |                                                                               |
|<nobr> DDI  [:house:](https://ddialliance.org/)  </nobr>                                                                                                                                         |Reports     |Studies            |XML      |          |                                                                               |
|<nobr> MEX [:books:](https://doi.org/10.1145/2814864.2814883) [:house:](http://aksw.org/Projects/MEX.html)  </nobr>                                                                              |Reports     |ML                 |XML      |          |                                                                               |
|<nobr> MLSchema  [:house:](https://github.com/ML-Schema/)  </nobr>                                                                                                                               |Reports     |ML                 |         |          |                                                                               |
|<nobr> MLFlow  [:house:](https://mlflow.org/)  </nobr>                                                                                                                                           |Reports     |ML                 |         |          |                                                                               |
|<nobr> Rmd  [:house:](https://rmarkdown.rstudio.com/)  </nobr>                                                                                                                                   |Reports     |Docs               |YAML     |Key-Value |                                                                               |
|<nobr> CWL [:books:](https://doi.org/10.6084/m9.figshare.3115156.v2) [:house:](https://www.commonwl.org/)  </nobr>                                                                               |Pipelines   |                   |YAML     |          |                                                                               |
|<nobr> CWLProv [:books:](https://doi.org/10.1093/gigascience/giz095) [:house:](https://github.com/common-workflow-language/cwlprov)  </nobr>                                                     |Pipelines   |                   |         |          |                                                                               |
|<nobr> RO-Crate  [:house:](https://researchobject.github.io/ro-crate/1.0/)  </nobr>                                                                                                              |Pipelines   |                   |         |          |                                                                               |
|<nobr> RO  [:house:](http://www.researchobject.org/)  </nobr>                                                                                                                                    |Pipelines   |                   |         |          |                                                                               |
|<nobr> WICUS  [:house:](http://vocab.linkeddata.es/wicus/wicus/)  </nobr>                                                                                                                        |Pipelines   |                   |         |          |                                                                               |
|<nobr> OPM  [:house:](https://openprovenance.org/opm/)  </nobr>                                                                                                                                  |Pipelines   |                   |         |          |                                                                               |
|<nobr> PROV-O  [:house:](https://www.w3.org/TR/prov-o/)  </nobr>                                                                                                                                 |Pipelines   |                   |         |          |                                                                               |
|<nobr> ReproZIp  [:house:](https://www.reprozip.org/)  </nobr>                                                                                                                                   |Pipelines   |                   |         |          |                                                                               |
|<nobr> ProvOne  [:house:](https://purl.dataone.org/provone-v1-dev)  </nobr>                                                                                                                      |Pipelines   |                   |         |          |                                                                               |
|<nobr> WES    </nobr>                                                                                                                                                                            |Pipelines   |                   |         |          |                                                                               |
|<nobr> BagIt  [:house:](https://tools.ietf.org/html/rfc8493)  </nobr>                                                                                                                            |Pipelines   |                   |         |          |                                                                               |
|<nobr> BCO    </nobr>                                                                                                                                                                            |Pipelines   |                   |         |          |                                                                               |
|<nobr> ERC [:books:](https://doi.org/10.5281/zenodo.2203844) [:house:](https://o2r.info/erc-spec/)  </nobr>                                                                                      |Pipelines   |Research Compendia |YAML     |Key-Value |                                                                               |
|<nobr> BEL    </nobr>                                                                                                                                                                            |Publication |                   |         |          |                                                                               |
|<nobr> DC    </nobr>                                                                                                                                                                             |Publication |                   |         |          |                                                                               |
|<nobr> JATS  [:house:](https://jats.nlm.nih.gov/)  </nobr>                                                                                                                                       |Publication |Articles           |XML      |Tags DTD  |                                                                               |
|<nobr> ONIX    </nobr>                                                                                                                                                                           |Publication |                   |         |          |                                                                               |
|<nobr> MeSH    </nobr>                                                                                                                                                                           |Publication |                   |         |          |                                                                               |
|<nobr> LCSH    </nobr>                                                                                                                                                                           |Publication |                   |         |          |                                                                               |
|<nobr> MP [:books:](https://doi.org/10.1186/2041-1480-5-28)   </nobr>                                                                                                                            |Publication |Micropublications  |         |OWL       |                                                                               |
|<nobr> Open PHACTS [:books:](https://doi.org/10.1016/j.drudis.2012.05.016) [:house:](https://www.openphacts.org/)  </nobr>                                                                       |Publication |Drugs              |         |RDF/XML   |                                                                               |
|<nobr> SWAN [:books:](https://doi.org/10.1016/j.jbi.2008.04.010)   </nobr>                                                                                                                       |Publication |Neuromedicine      |         |          |                                                                               |
|<nobr> SPAR  [:house:](http://www.sparontologies.net/)  </nobr>                                                                                                                                  |Publication |Publishing         |         |OWL       |                                                                               |
|<nobr> PWO [:books:](https://doi.org/10.3233/SW-160230)   </nobr>                                                                                                                                |Publication |Publishing         |         |          |                                                                               |
|<nobr> PAV [:books:](https://doi.org/10.1186/2041-1480-4-37)   </nobr>                                                                                                                           |Publication |Authorship         |XML      |RDF/XML   |                                                                               |
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



