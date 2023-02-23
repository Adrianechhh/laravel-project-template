FROM rabbitmq:3.9.20-management-alpine

RUN apk update && apk add curl

RUN curl -L -o plugins/elixir-1.12.2.ez https://github.com/noxdafox/rabbitmq-message-deduplication/releases/download/0.5.4/elixir-1.12.2.ez
RUN curl -L -o plugins/rabbitmq_message_deduplication-0.5.4.ez https://github.com/noxdafox/rabbitmq-message-deduplication/releases/download/0.5.4/rabbitmq_message_deduplication-0.5.4.ez
RUN curl -L -o plugins/rabbitmq_delayed_message_exchange-3.9.0.ez https://github.com/rabbitmq/rabbitmq-delayed-message-exchange/releases/download/3.9.0/rabbitmq_delayed_message_exchange-3.9.0.ez

RUN rabbitmq-plugins enable rabbitmq_delayed_message_exchange
RUN rabbitmq-plugins enable rabbitmq_message_deduplication
RUN rabbitmq-plugins enable rabbitmq_federation_management
RUN rabbitmq-plugins enable rabbitmq_federation
