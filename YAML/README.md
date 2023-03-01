https://lzone.de/cheat-sheet/YAML


# YAML
    YAML is CASE sensitive
    End your YAML file with the .yaml or .yml extension
    YAML is a superset of JSON
    each line of text contains key and value pairs like a map.
    key and values are separated by a colon (:) and space
    use spaces instead of the tab for indentation
    first-line begins with ---
    End of the document with ...
    Azure Pipelines, Ansible playbooks are YAML files 

# Comments
    # A single line comment example

    # block level comment example
    # comment line 1
    # comment line 2
    # comment line 3

# Types
    - Number 
        number1: 1          # integer          
        number2: 1.234      # float   

    - String
        s1: 'Hello!'        # string        
        s2: "Hello!"        # string           
        s3: Hello!          # string           

    - Boolean 
        b: false            # boolean type 

    - Timestamp
        d: 2015-04-05       # date type

    - Binary 

    - Sequence
        - Mark McGwire
        - Sammy Sosa
        - Ken Griffey

    - Mapping (key: value)
        hr:  65       # Home runs
        avg: 0.278    # Batting average
        rbi: 147      # Runs Batted In
  
# Variables 
    name: &VAR_NAME John
    other_name: *VAR_NAME   

# Multiline Strings
    - Block notation: Newlines become spaces
        description: 
        Hello
        World

    - Literal style: Newlines are preserved
        description: |
        Hello
        World

# Multiple Documents
    A YAML file can have multiple documents, this is why every document needs to start with a “—” line

    ---
    content: doc1
    ---
    content: doc2
    This also means YAML parsers might return multiple documents!

# Indented blocks syntax
    id: 1
    name: Franc
    salary: 5000

# Inline blocks syntax
    {id:1,name: Franc,salary: 5000}

# Mapping Sequences 
    Linux:
      - Fedora
      - Slackware
    BSD:
      - FreeBSD
      - NetBSD

# Sequence of Mappings

    children:
      - name: Jimmy Smith
        age: 15
      - name: Jimmy Smith
        age: 15
      - name: Sammy Sosa
        age: 12

# Sequence of Sequences
    my_sequences:
      - [1, 2, 3]
      - [4, 5, 6]

# Mapping of Mappings

    Mark McGwire: {hr: 65, avg: 0.278}
    Sammy Sosa: {
        hr: 63,
        avg: 0.288
    }

    Desktop:
      CPU: RISC-V
      RAM: '32 GB'
    Laptop:
      CPU: AMD
      RAM: '16 GB'
  
# Nested Collections

    Jack:
      id: 1
      name: Franc
      salary: 25000
      hobby:
        - a
        - b
     location: {country: "A", city: "A-A"} 


# STEP 1

stages:
  - stage: Build
    jobs:
      - job: 

  - stage: DEV
    displayName: Deploy in DEV
    jobs:
      - job:

  - stage: QA
    displayName: Deploy in QA
    jobs:
      - job:

  - stage: PRD
    displayName: Deploy in PRD
    jobs:
      - job:
