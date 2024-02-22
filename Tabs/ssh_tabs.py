import paramiko


class Connection:
    port = 2222
    username = 'ssh'
    password = 'ssh'
    execute_command = "su"
    def __init__(self, port, username, password, execute_command):
        self.port = port
        self.client = paramiko.SSHClient()
        self.username = username
        self.password = password
        self.execute_command = execute_command


    def __setattr__(self, ):
con = Connection()
print(con.__dict__)