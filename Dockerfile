FROM node:0.10

RUN npm install hexo -g  && hexo init /blog/ && cd /blog/ && npm install && npm install hexo-hey --save
WORKDIR /blog
RUN cat package.json
RUN git clone --progress --verbose https://github.com/winningappliances/Hexo-Configuration.git Hexo-Config/
WORKDIR /blog/Hexo-Config/
RUN ls -l
RUN mv magnetic/ /blog/themes/magnetic/
RUN rm -rf /blog/node_modules/hexo-hey/www
RUN mv www/ /blog/node_modules/hexo-hey/www
COPY _config.yml /blog/_config.yml
COPY api.js /blog/node_modules/hexo-hey/
COPY index.js /blog/node_modules/hexo-hey/
VOLUME /blog
EXPOSE 4000 
WORKDIR /blog
RUN rm -rf _config.yml
RUN ls -l
CMD hexo server
