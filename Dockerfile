ARG DebianVersion

FROM debian:${DebianVersion}

ARG USERNAME=abc
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

# Install necessary packages
RUN apt-get update \
    && apt-get install -y \
    libavif-bin \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# Create a non-root user with sudo privileges
RUN groupadd -g ${USER_GID} ${USERNAME} \
    && useradd -m -u ${USER_UID} -g ${USER_GID} -s /bin/bash ${USERNAME}

# Modify the user and group IDs and change ownership of the home directory
RUN groupmod --gid ${USER_GID} ${USERNAME} \
    && usermod --uid ${USER_UID} --gid ${USER_GID} ${USERNAME} \
    && chown -R ${USER_UID}:${USER_GID} /home/${USERNAME}

# Set the working directory
WORKDIR /home/${USERNAME}

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME

# Set the entrypoint to avifenc
# https://github.com/AOMediaCodec/libavif/blob/main/doc/avifenc.1.md
ENTRYPOINT ["avifenc"]
