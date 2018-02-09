#!groovy

node {
    createBuildConfig()
    build()
}

def createBuildConfig()
{
    def bc = openshift.selector("bc", "${JOB_NAME}")
    print bc
    if (bc.names().size() == 0) {
        print "criando"
        openshift.process( readFile(file:'template.yaml'), "-p", "JOB_NAME=${JOB_NAME}")
    }
}

def build()
{
    //openshiftBuild(buildConfig: "${JOB_NAME}")
}

