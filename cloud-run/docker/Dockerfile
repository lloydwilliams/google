FROM openjdk:8
ADD https://dtdg.co/latest-java-tracer /dd-java-agent.jar
RUN apt-get update && apt-get install -y procps
RUN apt-get install -y ca-certificates
ARG JAR_FILE=target/payroll-3.0.1.jar
COPY ${JAR_FILE} app.jar
COPY ./target/start.sh /start.sh
RUN chmod a+rx /start.sh

# copy the Datadog `serverless-init` into your Docker image
COPY --from=datadog/serverless-init /datadog-init /app/datadog-init

#java -Xms512m -Xmx512m -javaagent:/dd-java-agent.jar -Duser.timezone=UTC -Ddd.trace.methods=com.example.payroll.EmployeeController[*] \
# -Ddd.logs.injection=true -Ddd.service=payroll -Ddd.source=java -Ddd.env=dev -Ddd.version=3.0.1 /app.jar
# optionally add Datadog tags
ENV DD_SERVICE=payroll-cloud-run
ENV DD_ENV=gcp
ENV DD_VERSION=3.0.1
ENV DD_TRACE_METHODS=com.example.payroll.EmployeeController[*]

# change the entrypoint to wrap your application into the Datadog serverless-init process
ENTRYPOINT ["/app/datadog-init"]

# execute your binary application wrapped in the entrypoint. Adapt this line to your needs
#CMD ["./mvnw", "spring-boot:run"]

CMD ["sh", "/start.sh"]