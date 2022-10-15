pipeline {
  agent any
  stages {
    stage('copy-ci-cd-artifactory') {
      agent any
      environment {
        tag = 'sh(returnStdout: true, script: "git rev-parse --short=10 HEAD").trim()'
        SRC_REG = 'quay.io/mocf-api'
        SRC_TAG = 'latest'
        DEST_REG = 'quay.io/mocf-api-deploy'
      }
      steps {
        sh '''withCredentials([usernamePassword(credentialsId: \'jenkins-credentials\', usernameVariable: \'IR_CREDS_USR\', passwordVariable: \'IR_CREDS_PSW\')]) {
sh "skopeo login quay.io --username=${IR_CREDS_USR} --password=${IR_CREDS_PSW}"
}
skopeo copy docker://${SRC_REG} docker://${DEST_REG}:${tag}
'''
        }
      }

      stage('helm-deploy') {
        agent any
        environment {
          OC_API_URL = 'https://api.sharedocp4upi48.lab.upshift.rdu2.redhat.com:6443'
          DEV_NAMESPACE = 'jenkins-test'
          RELEASE_NAME = 'dev'
        }
        steps {
          sh '''withCredentials([usernamePassword(credentialsId: \'oc-credentials\', usernameVariable: \'OC_CREDS_USR\', passwordVariable: \'OC_CREDS_PSW\')]) {
sh "oc login -u ${OC_CREDS_USR} --password=${OC_CREDS_USR} ${OC_API_URL}"
}
helm upgrade --install --create-namespace -n ${NAMESPACE} -f environments/values.dev.yaml --set=cmData=random,cmSecret=random,imageName=${} development .
'''
          }
        }

      }
    }