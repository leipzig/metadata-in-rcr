#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

# MIT License
#
# Copyright (c) 2020 Jeremy Leipzig
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

baseCommand: "timelinehelper.R"

hints:
  SoftwareRequirement:
    packages:
      metadata-in-rcr-timeline:
        specs: 
          - (R Project for Statistical Computing, RRID:SCR_001905)
          - (tidyr, RRID:SCR_017102)
          - (knitr, RRID:SCR_018533)
          - (ggplot2, RRID:SCR_014601)
          - (readxl, RRID:SCR_018083)
          - (dplyr, RRID:SCR_016708)
        version: [ "v0.4" ]
  DockerRequirement:
    dockerPull: leipzig/metadata-in-rcr-timeline:v0.4

inputs:
  reportfile:
    type: string
    inputBinding:
      position: 1

outputs:
  report:
    type: File
    doc: The pipeline html file
    outputBinding:
      glob: $(inputs.reportfile)
      
label: "produce the timeline from Awesome Reproducible Research"

doc: 
  produce the timeline from Awesome Reproducible Research


$schemas: 
  - https://schema.org/version/3.9/schema.rdf

$namespaces: 
  iana: https://www.iana.org/assignments/media-types/
  s: http://schema.org/

