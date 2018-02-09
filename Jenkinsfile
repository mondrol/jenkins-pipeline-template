#!groovy

node {
    build()
}

def build () {
    openshiftBuild(buildConfig: '${JOB_NAME}')
}
