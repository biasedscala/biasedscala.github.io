cd _hugo
hugo -D
cd ..
rsync -zahuv _hugo/public/ ./
