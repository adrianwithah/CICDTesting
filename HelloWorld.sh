echo "Hello World!"

BRANCH="master"

# Are we on the right branch?
if [ "$TRAVIS_BRANCH" = "$BRANCH" ]; then
  
  # Is this not a Pull Request?
  if [ "$TRAVIS_PULL_REQUEST" = false ]; then
    
    # Is this not a build which was triggered by setting a new tag?
    if [ -z "$TRAVIS_TAG" ]; then
      echo "Starting to tag commit.\n"

      git config --global user.email "lim.weiheng.hadrian@gmail.com"
      git config --global user.name "adrianwithah"

      # Add tag and push to master.
      git tag -a v${TRAVIS_BUILD_NUMBER} -m "Travis build $TRAVIS_BUILD_NUMBER pushed a tag."
      git push origin --tags
      git fetch origin

      echo "Done magic with tags.\n"
    fi
    
    echo "After tag test"
  fi
  
  echo "After PR test"
fi

echo "After master branch test"
