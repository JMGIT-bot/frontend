FROM node:18 AS build
WORKDIR /app
COPY frontend/ . 
RUN npm install && npm run build
CMD ["echo", "Frontend build complete"] 
