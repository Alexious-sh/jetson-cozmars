FROM cozmars:1.0

# ============================
# INSTALL google-assistant-sdk
# ============================
RUN apt update && apt install -y portaudio19-dev libffi-dev libssl-dev
COPY cozmars/assistant-sdk-python/google-assistant-sdk/googlesamples/assistant/grpc/requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt
RUN rm /tmp/requirements.txt
RUN pip3 install google-assistant-sdk[samples]

#CMD python3 /opt/cozmars/assistant-sdk-python/google-assistant-sdk/googlesamples/
