#!/usr/bin/env bash
if [ "$1" != "major" ] && [ "$1" != "minor" ] && [ "$1" != "patch" ];
then
    echo "Could not release!"
    echo "Usage: 'npm run release -- (major|minor|patch)'"
    echo ""
    exit 1
fi

NEW_VERSION=$(npm version $1)

git add package.json package-lock.json
git commit -m 'Bump version'
echo "Bumped version to $NEW_VERSION"
git tag $NEW_VERSION
echo "Tagged with $NEW_VERSION"
git push && git push --tags