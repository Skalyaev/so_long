NAME=solong

CC=gcc
CFLAGS=-Wall -Wextra -Werror

INCLUDE_DIR=include
HEADER_EXT=h
HEADER=$(shell find $(INCLUDE_DIR) -type f -name "*.$(HEADER_EXT)")

SRC_EXT=c
SRC_DIR=src
SRC=$(shell find $(SRC_DIR) -type f -name "*.$(SRC_EXT)")

OBJ_DIR=obj
OBJ=$(subst $(SRC_DIR),$(OBJ_DIR),$(SRC:.c=.o))

MLX=mlx
LIB=./$(MLX) -lmlx -lXext -lX11

RM=rm -rf

all: ${NAME}

${NAME}: $(OBJ_DIR) ${OBJ}
	cd $(MLX) && make && cd ..
	${CC} ${CFLAGS} ${OBJ} -o ${NAME} -L ${LIB}

$(OBJ_DIR):
	@mkdir $(OBJ_DIR)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.$(SRC_EXT) ${HEADER}
	$(CC) $(CFLAGS) -c $< -o $(<:.$(SRC_EXT)=.o)
	@mv $(SRC_DIR)/*.o $@

clean:
	cd $(MLX) && make clean && cd ..
	${RM} ${OBJ_DIR}

fclean: clean
	${RM} ${NAME}

re: fclean all

.PHONY: all clean fclean re
