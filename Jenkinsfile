#!groovy

node {
    checkout scm
    createBuildConfig()
    build()
}

def createBuildConfig()
{
    openshift.withProject ("getup-images") {
        def bc = openshift.selector("buildconfig", "backup")

        if (!bc.exists()) {
            print "Creating BuildConfig ${JOB_NAME}"
            openshift.process(readFile(file: 'template.yaml'), "-p", "JOB_NAME=${JOB_NAME}")
        } else {
            print "BuildConfig ${JOB_NAME} already exists"
        }
    }

}

def build()
{
    openshiftBuild(buildConfig: "${JOB_NAME}")
}
