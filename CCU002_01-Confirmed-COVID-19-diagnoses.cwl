cwlVersion: v1.0
steps:
  read-potential-cases-disc:
    run: read-potential-cases-disc.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
      potentialCases:
        id: potentialCases
        source: potentialCases
  ccu002_01-confirmed-covid-19-diagnoses-antigen---primary:
    run: ccu002_01-confirmed-covid-19-diagnoses-antigen---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-disc/output
  acute-ccu002_01-confirmed-covid-19-diagnoses---primary:
    run: acute-ccu002_01-confirmed-covid-19-diagnoses---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: ccu002_01-confirmed-covid-19-diagnoses-antigen---primary/output
  ccu002_01-confirmed-covid-19-diagnoses-detected---primary:
    run: ccu002_01-confirmed-covid-19-diagnoses-detected---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: acute-ccu002_01-confirmed-covid-19-diagnoses---primary/output
  ccu002_01-confirmed-covid-19-diagnoses-serum---primary:
    run: ccu002_01-confirmed-covid-19-diagnoses-serum---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: ccu002_01-confirmed-covid-19-diagnoses-detected---primary/output
  ribonucleic-ccu002_01-confirmed-covid-19-diagnoses---primary:
    run: ribonucleic-ccu002_01-confirmed-covid-19-diagnoses---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: ccu002_01-confirmed-covid-19-diagnoses-serum---primary/output
  positive-ccu002_01-confirmed-covid-19-diagnoses---primary:
    run: positive-ccu002_01-confirmed-covid-19-diagnoses---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: ribonucleic-ccu002_01-confirmed-covid-19-diagnoses---primary/output
  ccu002_01-confirmed-covid-19-diagnoses-scale---primary:
    run: ccu002_01-confirmed-covid-19-diagnoses-scale---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: positive-ccu002_01-confirmed-covid-19-diagnoses---primary/output
  ccu002_01-confirmed-covid-19-diagnoses-reference---primary:
    run: ccu002_01-confirmed-covid-19-diagnoses-reference---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: ccu002_01-confirmed-covid-19-diagnoses-scale---primary/output
  ccu002_01-confirmed-covid-19-diagnoses-speciman---primary:
    run: ccu002_01-confirmed-covid-19-diagnoses-speciman---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: ccu002_01-confirmed-covid-19-diagnoses-reference---primary/output
  ccu002_01-confirmed-covid-19-diagnoses-antibody---primary:
    run: ccu002_01-confirmed-covid-19-diagnoses-antibody---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: ccu002_01-confirmed-covid-19-diagnoses-speciman---primary/output
  ccu002_01-confirmed-covid-19-diagnoses-assay---primary:
    run: ccu002_01-confirmed-covid-19-diagnoses-assay---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: ccu002_01-confirmed-covid-19-diagnoses-antibody---primary/output
  ccu002_01-confirmed-covid-19-diagnoses-detection---primary:
    run: ccu002_01-confirmed-covid-19-diagnoses-detection---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: ccu002_01-confirmed-covid-19-diagnoses-assay---primary/output
  ccu002_01-confirmed-covid-19-diagnoses-severity---primary:
    run: ccu002_01-confirmed-covid-19-diagnoses-severity---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: ccu002_01-confirmed-covid-19-diagnoses-detection---primary/output
  ccu002_01-confirmed-covid-19-diagnoses-coronavirus---primary:
    run: ccu002_01-confirmed-covid-19-diagnoses-coronavirus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: ccu002_01-confirmed-covid-19-diagnoses-severity---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule16
      potentialCases:
        id: potentialCases
        source: ccu002_01-confirmed-covid-19-diagnoses-coronavirus---primary/output
class: Workflow
inputs:
  potentialCases:
    id: potentialCases
    doc: Input of potential cases for processing
    type: File
  inputModule1:
    id: inputModule1
    doc: Python implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
  inputModule16:
    id: inputModule16
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
