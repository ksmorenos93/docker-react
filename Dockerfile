FROM node:18-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install 

# in production we will copy everythin 
COPY . .  

RUN npm run build  ## this is another option 

# the build folder will be created in WORKDIR

FROM nginx 

# we will copy from the phase builder to the nginx folder
COPY --from=builder /app/build /usr/share/nginx/html






