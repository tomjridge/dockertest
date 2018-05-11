# NOTE maybe add a "RUN echo ..." to force a rebuild, or --no-cache

# FROM ocaml/opam:ubuntu - latest doesn't work due to problems with ppx_deriving deps
FROM ocaml/opam:ubuntu-17.04_ocaml-4.04.2 

RUN opam list
RUN opam update
RUN opam install batteries extunix
RUN opam install ppx_deriving_yojson extlib core ppx_bin_prot ocaml-compiler-libs lwt


RUN opam list
RUN ocamlfind list



# NOTE in following not sure why this eval needs to be there -
# shouldn't the default RUN setup the opam env anyway?

RUN git clone https://github.com/tomjridge/isa_btree.git 
RUN eval `opam config env` && make -C isa_btree

RUN git clone https://github.com/tomjridge/tjr_monad.git 
RUN eval `opam config env` && make -C tjr_monad

RUN echo force rebuild from here
RUN git clone https://github.com/tomjridge/tjr_fs_shared.git 
RUN eval `opam config env` && make -C tjr_fs_shared

RUN git clone https://github.com/tomjridge/path_resolution.git
RUN eval `opam config env` && make -C path_resolution

RUN git clone -b dev https://github.com/tomjridge/tjr_btree.git
RUN eval `opam config env` && make -C tjr_btree 


# run some examples and tests
RUN eval `opam config env` && make -C tjr_btree/test_bin all run_tests 

RUN eval `opam config env` && make -C tjr_btree/examples all run_examples


