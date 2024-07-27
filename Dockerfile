FROM python:3.11

WORKDIR /workspace
COPY download_nltk.py .

RUN apt-get update && apt-get install graphviz -y && apt-get clean
RUN apt-get install libhdf5-serial-dev -y

RUN python -m pip install spacy nltk && \
    python download_nltk.py
RUN spacy download en_core_web_sm

COPY ./requirements.txt /workspace

RUN --mount=type=cache,target=/root/.cache/pip python -m pip install --no-cache -r requirements.txt --timeout=4000

ENV TZ=Asia/Tokyo
RUN echo "$TZ" > /etc/timezone \
  && rm /etc/localtime \
  && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
  && dpkg-reconfigure -f noninteractive tzdata

COPY ./notebooks/ /workspace/notebooks/
WORKDIR /workspace/notebooks/

CMD ["jupyter", "notebook", "--ip", "0.0.0.0", "--allow-root"]