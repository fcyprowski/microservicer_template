# Part of the microservicer project (soon)
 
## What's that?
A template for the R microservice - REST API written in R, packaged with Docker
and deployed on Kubernetes cluster. If anything is wrong or you have an idea
on what could be changed here, don't hesitate to write: f.cyprowski@gmail.com

## Reasons
R is really hard to deploy in comparison to Python, so - for now - most of data scientist
would prefer to work with R only in the "experimentation mode". And well, let's be honest
- it has to do with the language design, lack of standarization and years of 
littering the R world with the "scientist's code" and "analytics experience".
I want to change that. R with the whole tidyverse is one of
the best languages to work with complicated data structures. We just need the tools
to make it more accessible for machines.

## Ambitions
Package should provide not only the Dockerfiles and kubernetes yamls, but also
a full standarized working method with that kind of environment. So you should expect
here some functions that will make a use of specified working directory trees and
enforce good practices. And I really mean "ENFORCE" because the R is dying of the
lack of standarization.
So - first the structure. Then we'll march to Kubeflow.

## Other solutions
Yeah, there are some of them. In fact, through my whole carrier I've met only two
packages that can in some way help you to build a microservice. Packrat - the most
annoying package ever with a big middle finger aimed at a declarative management
and loooong build times and unintuitive resource management. And checkpoint - simple
good enough package manager.