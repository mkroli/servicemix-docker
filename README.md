Apache ServiceMix Docker image
==============================

Run
---

```bash
docker run -d -t \
  --name servicemix \
  -p 1099:1099 \
  -p 8101:8101 \
  -p 8181:8181 \
  -p 61616:61616 \
  -p 36888:36888 \
  -p 44444:44444 \
  -v /host/path/deploy:/deploy \
  mkroli/servicemix
```
