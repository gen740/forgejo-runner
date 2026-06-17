FROM nixos/nix:latest

LABEL org.opencontainers.image.title="forgejo-runner"
LABEL org.opencontainers.image.description="Minimal Nix-based image with Node.js for Forgejo Actions jobs"

RUN nix-channel --update \
    && printf '%s\n' 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf \
    && (nix-env -e git-minimal || true) \
    && nix-env -iA \
        nixpkgs.bash \
        nixpkgs.cacert \
        nixpkgs.coreutils \
        nixpkgs.curl \
        nixpkgs.git \
        nixpkgs.nodejs_22

CMD ["/bin/bash"]
