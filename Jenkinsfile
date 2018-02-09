#!groovy

node {
    createBuildConfig()
    build()
}

def createBuildConfig()
{
    sh "oc get bc ${JOB_NAME}"
}

def build()
{
    #openshiftBuild(buildConfig: "${JOB_NAME}")
}
