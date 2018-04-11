# NOTE maybe add a "RUN echo ..." to force a rebuild
FROM ocaml/opam:ubuntu
RUN opam list
RUN opam install batteries extunix
RUN opam list
RUN ocamlfind list
RUN git clone https://github.com/tomjridge/tjr_fs_shared.git 

# NOTE not sure why this eval needs to be there - shouldn't the
# default RUN setup the opam env anyway?

RUN eval `opam config env` && make -C tjr_fs_shared


RUN git clone https://github.com/tomjridge/path_resolution.git

RUN eval `opam config env` && make -C path_resolution

