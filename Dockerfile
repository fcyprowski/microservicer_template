FROM gcr.io/your-account/some-base-r-image
COPY . .
RUN Rscript ./build.R
CMD ["Rscript", "./run.R"]
EXPOSE 5000