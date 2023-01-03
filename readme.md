UI-Automation-Robot-Framework

## Included
* python
* robotframework
* robotframework-seleniumlibrary
* robotframework-datadriver
* robotframework-pabot

To run specific file 

```bash
   robot .\file.robot 
```

To run all file 

```bash
   robot .
```

To run suites parallel

```bash
    pabot .
```

To run tests in parallel

```bash
  pabot --testlevelsplit  testfile.robot
```

Run test cases using tag

```bash
robot --include <tagname> .
```
Skip test case using tag

```bash
robot --exclude <tagname> .
```
Run all test within a folder

```bash
robot --suite <foldername>
```

Run previous failed tests

```bash
robot --rerunfailed output.xml .
```
Run tests using multiple tags

```bash
robot --include <tagname1> AND <tagname2> .
```
```bash
robot --include <tagname1> OR <tagname2> .
```
set variable from command

```bash
robot --variable variable_name:variable file.robot
```