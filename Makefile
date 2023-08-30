NAME		= so_long

CC		= gcc
CFLAGS		= -Wall -Wextra -Werror -fsanitize=address
RM		= rm -rf

SRC_DIR		= src
OBJ_DIR		= obj
SRC_EXT		= c
SRC_COUNT	= $(shell find $(SRC_DIR) -type f -name "*.$(SRC_EXT)" | wc -l)
SRC		= $(shell find $(SRC_DIR) -type f -name "*.$(SRC_EXT)")
OBJ		= $(subst $(SRC_DIR),$(OBJ_DIR),$(SRC:.c=.o))
LIB		= mlx_linux/ -lmlx -lXext -lX11

all		: ${NAME}

make_mlx	:
		cd mlx_linux && make

clean_mlx	:
		cd mlx_linux && make clean

ifeq ($(SRC_COUNT), 13)
${NAME}		: make_mlx $(OBJ_DIR) ${OBJ}
		${CC} ${CFLAGS} -o ${NAME} ${OBJS} -L ${LIB} 
else
$(NAME)		:
		@echo "Srcs corrupted, aborting"
endif

$(OBJ_DIR)	:
		@mkdir $(OBJ_DIR)

$(OBJ_DIR)/%.o	: $(SRC_DIR)/%.$(SRC_EXT)
		$(CC) $(CFLAGS) -c $< -o $(<:.$(SRC_EXT)=.o)
		@mv $(SRC_DIR)/*.o $@

clean		:
		${RM} ${OBJ_DIR}

fclean		: clean
		${RM} ${NAME}

re		: fclean all

.PHONY		: all bonus clean fclean re
