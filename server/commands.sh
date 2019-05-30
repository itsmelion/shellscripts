editServer() {
  sudo code $NGINX/sites-available/"$1".conf
}

addSite() {
  sudo cp $NGINX/sites-available/base.conf $NGINX/sites-available/"$1".conf
  sudo ln -s $NGINX/sites-available/"$1".conf $NGINX/sites-enabled/"$1".conf
  mkdir -p $SITES/"$1"
  cd $SITES/"$1"
}

commands() {
  echo "nginx-restart"
  echo "addSite 'param' = create nginx 'param'.conf and folder at 'SITES ($SITES/param)'"
  echo "editServer 'param' = code 'param'.conf"
}

atServer(){
  printf 'Welcome to ALIA server.. thread carefully'
}

atServer
