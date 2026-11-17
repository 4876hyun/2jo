
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    for SERVER in 172.16.32.13 172.16.32.14
                    do
                        echo "Deploying to $SERVER"

                        scp -o BatchMode=yes app.py requirements.txt \
                          deploy@$SERVER:/opt/myapp/ || exit 1

                        ssh -o BatchMode=yes deploy@$SERVER \
                          'sudo -n /usr/bin/systemctl restart myapp.service' || exit 1

                        echo "Deployment completed: $SERVER"
                    done
                '''
            }
        }
    }
}
