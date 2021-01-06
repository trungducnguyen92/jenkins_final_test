pipeline {
    agent none
	
    environment {
        PASS = credentials('registry-pass')
    }
	
    parameters {
        choice(
            choices: ['nodejs' , 'python', 'all'],
            description: '',
            name: 'REQUESTED_ACTION')
    }

    stages {
        
        stage ('build-nodejs') {
            agent {label 'master'}
            when {
                expression { params.REQUESTED_ACTION == 'nodejs' }
            }
            steps {
                echo "Building app nodejs!"
                sh './nodejs-app/Build.sh'
            }
        }
		
		stage ('push-nodejs') {
		    agent {label 'master'}
            when {
                expression { params.REQUESTED_ACTION == 'nodejs' }
            }
            steps {
                echo "Pushing nodejs container image!"
                sh './nodejs-app/push.sh'
            }
        }
		
		stage ('deploy-nodejs') {
		    agent {label 'jenkin_2'}
            when {
                expression { params.REQUESTED_ACTION == 'nodejs' }
            }
            steps {
                echo "Deploy nodejs container image!"
                sh './nodejs-app/Deploy.sh'
            }
        }
		
        stage ('build-python') {
            agent {label 'master'}
            when {
                expression { params.REQUESTED_ACTION == 'python' }
            }
            steps {
                echo "Building app python!"
                sh './python-app/Build.sh'
            }
        }
		
		stage ('push-python') {
		    agent {label 'master'}
            when {
                expression { params.REQUESTED_ACTION == 'python' }
            }
            steps {
                echo "Pushing python container image!"
                sh './python-app/Push.sh'
            }
        }
		
		stage ('deploy-python') {
		    agent {label 'jenkin_2'}
            when {
                expression { params.REQUESTED_ACTION == 'python' }
            }
            steps {
                echo "Deploy python container image!"
                sh './python-app/Deploy.sh'
            }
        }
		
        stage ('all') {
            agent {label 'master'}
            when {
                expression { params.REQUESTED_ACTION == 'all' }
            }
            steps {
                echo "Building app all!"
                sh '''
                ./nodejs-app/Build.sh
		./python-app/Build.sh
                '''
            }
        }
		
		stage ('push-all') {
		    agent {label 'master'}
            when {
                expression { params.REQUESTED_ACTION == 'all' }
            }
            steps {
                echo "Pushing all container image!"
                sh '''
                ./nodejs-app/push.sh
		./python-app/Push.sh
                '''
            }
        }
		
		stage ('deploy-all') {
		    agent {label 'jenkin_2'}
            when {
                expression { params.REQUESTED_ACTION == 'all' }
            }
            steps {
                echo "Deploy all container image!"
                sh '''
                ./nodejs-app/Deploy.sh
		./python-app/Deploy.sh
                '''
            }
        }
    }
}
