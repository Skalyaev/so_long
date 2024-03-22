NAME		= so_long

CC		= gcc
CFLAGS		= -Wall -Wextra -Werror -fsanitize=address
RM		= rm -rf

SRC_DIR		= src
OBJ_DIR		= obj
SRC_EXT		= c
SRC		= $(shell find $(SRC_DIR) -type f -name "*.$(SRC_EXT)")
OBJ		= $(subst $(SRC_DIR),$(OBJ_DIR),$(SRC:.c=.o))
LIB		= mlx_linux/ -lmlx -lXext -lX11

all		: ${NAME}

make_mlx	:
		cd mlx_linux && make

clean_mlx	:
		cd mlx_linux && make clean

fclean_mlx	:
		cd mlx_linux && make fclean

${NAME}		: make_mlx $(OBJ_DIR) ${OBJ}
		${CC} ${CFLAGS} -o ${NAME} ${OBJ} -L ${LIB} 

$(OBJ_DIR)	:
		@mkdir $(OBJ_DIR)

$(OBJ_DIR)/%.o	: $(SRC_DIR)/%.$(SRC_EXT)
		$(CC) $(CFLAGS) -c $< -o $(<:.$(SRC_EXT)=.o)
		@mv $(SRC_DIR)/*.o $@

clean		: clean_mlx
		${RM} ${OBJ_DIR}

fclean		: clean fclean_mlx
		${RM} ${NAME}

re		: fclean all

.PHONY		: all bonus clean fclean re
