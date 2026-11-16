pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Deploy WAS01') {
            steps {
                sh '''
                rsync -av app.py requirements.txt \
                  deploy@172.16.32.13:/opt/myapp/

                ssh deploy@172.16.32.13 \
                  '/opt/myapp/venv/bin/pip install -r /opt/myapp/requirements.txt && sudo systemctl restart myapp.service'
                '''
            }
        }

        stage('Deploy WAS02') {
            steps {
                sh '''
                rsync -av app.py requirements.txt \
                  deploy@172.16.32.14:/opt/myapp/

                ssh deploy@172.16.32.14 \
                  '/opt/myapp/venv/bin/pip install -r /opt/myapp/requirements.txt && sudo systemctl restart myapp.service'
                '''
            }
        }
    }
}
