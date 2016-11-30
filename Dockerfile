FROM node:0.10
RUN npm install hexo -g && hexo init /blog/ && cd /blog/ && npm install
RUN npm install hexo-hey --save
WORKDIR /blog
RUN ls -l
RUN git clone --progress --verbose https://github.com/winningappliances/Hexo-Configuration.git Hexo-Config/
WORKDIR /blog/Hexo-Config/
RUN mv magnetic/ /blog/themes/magnetic/
RUN mv www/ /blog/node_modules/hexo-hey/www
COPY _config.yml /blog/_config.yml
COPY api.js /blog/node_modules/hexo-hey/
COPY index.js /blog/node_modules/hexo-hey/
ADD hexo-winningadmin/ Hexo-Config/
VOLUME /blog
EXPOSE 4000 
WORKDIR /blog