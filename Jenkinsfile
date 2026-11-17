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

                    rsync -av app.py requirements.txt \
                      deploy@$SERVER:/opt/myapp/

                    ssh deploy@$SERVER \
                      '/opt/myapp/venv/bin/pip install -r /opt/myapp/requirements.txt && sudo systemctl restart myapp.service'
                done
                '''
            }
        }
    }
}
