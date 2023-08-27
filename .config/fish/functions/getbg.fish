function getbg --wraps=swww\ query\ \|\ cut\ -d\'\ \'\ -f --description alias\ getbg\ swww\ query\ \|\ cut\ -d\'\ \'\ -f8
  swww query | cut -d' ' -f8 $argv 
end
