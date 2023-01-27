function grec -d "display 10 most recently active branches"
    git for-each-ref --sort=-committerdate refs/heads/ --count=10 \
      --format='%(HEAD) %(color:yellow)%(objectname:short)%(color:reset) (%(color:blue)%(committerdate:relative)%(color:reset)) %(color:green bold)%(refname:short)%(color:reset) %(contents:subject)'
end