FROM python:3.10

WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY . .
RUN chmod 600 secrets/.vault_pass
# RUN ansible-playbook secrets/ansible_playbook.yml --vault-password-file secrets/.vault_pass
# CMD ["ansible-playbook", "secrets/ansible_playbook.yml", "--vault-password-file", "secrets/.vault_pass"]
# ENTRYPOINT ["python","src/main.py"]
ENTRYPOINT ["/bin/sh", "-c" , "chmod 600 secrets/.vault_pass && ansible-playbook secrets/ansible_playbook.yml --vault-password-file secrets/.vault_pass && python src/main.py && ls && cd secrets && ls && rm secrets.yml"]
