FROM petzi/pre-commit:1.15.2-9
COPY requirements.txt /
RUN pip3 install --no-cache-dir -r requirements.txt
COPY .pre-commit-config.yaml /
COPY compose-check.sh /usr/local/bin/
COPY --from=koalaman/shellcheck:v0.7.2 /bin/shellcheck /usr/local/bin/
COPY --from=mvdan/shfmt:v3.4.0 /bin/shfmt /usr/local/bin/
