# NOTE maybe add a "RUN echo ..." to force a rebuild, or --no-cache

# FROM ocaml/opam:ubuntu - latest doesn't work due to problems with ppx_deriving deps
FROM ocaml/opam:ubuntu-17.04_ocaml-4.04.2 

RUN opam list
RUN opam update
RUN opam install batteries extunix
RUN opam install ppx_deriving_yojson extlib core ppx_bin_prot ocaml-compiler-libs


RUN opam list
RUN ocamlfind list
RUN git clone https://github.com/tomjridge/tjr_fs_shared.git 

# NOTE not sure why this eval needs to be there - shouldn't the
# default RUN setup the opam env anyway?

RUN eval `opam config env` && make -C tjr_fs_shared


RUN git clone https://github.com/tomjridge/path_resolution.git

RUN eval `opam config env` && make -C path_resolution


RUN git clone -b dev https://github.com/tomjridge/tjr_btree.git
RUN eval `opam config env` && make -C tjr_btree all install


