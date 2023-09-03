FROM ruby:2.7
# 何をベースにするか。今回はruby2.7のイメージからレイヤを作成する

WORKDIR /var/www
# これは何でもいい。この後の作業をどこでやるかという場所を指定する
# ディレクトリがない場合は作成される

COPY ./src /var/www/
# ソースコードをコピーする。ローカルのコードをdockerの方にコピーできる。

RUN bundle config --local set path 'vender/bundle' \
  && bundle install

CMD ["bundle", "exec", "ruby", "app.rb"]
