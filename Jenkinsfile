#!groovy

node {
    createBuildConfig()
    build()
}

def createBuildConfig()
{
    result = sh returnStdout: true, script: "oc get bc ${JOB_NAME} -o name"

    if (result.trim() == "") {
        openshift.process( readFile(file:'template.yaml'), "-p", "JOB_NAME=${JOB_NAME}")
    }
}

def build()
{
    //openshiftBuild(buildConfig: "${JOB_NAME}")
}
