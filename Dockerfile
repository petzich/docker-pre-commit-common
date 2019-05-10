FROM petzi/pre-commit:dev-latest-alpine
COPY requirements.txt /
RUN pip3 install --no-cache-dir -r requirements.txt
COPY .pre-commit-config.yaml /
COPY compose-check.sh /
COPY --from=koalaman/shellcheck:v0.6.0 /bin/shellcheck /usr/local/bin/
COPY --from=mvdan/shfmt:v2.6.4 /bin/shfmt /usr/local/bin/
