FROM docker.io/library/node:16.13-alpine3.12
COPY *txt /
COPY *json /
RUN npm install -g mocf
CMD ["mocf", "-p", "4505", "10m.txt", "1m.txt", "100k.txt", "75k.txt", "10k.txt", "15k.txt", "20k.txt", "25k.txt", "2k.txt", "30k.txt", "40k.txt", "50k.txt", "5k.txt", "64k.txt", "65k.txt"]
