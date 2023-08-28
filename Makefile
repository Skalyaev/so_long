# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: anguinau <constantasg@gmail.com>           +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/27 01:48:21 by anguinau          #+#    #+#              #
#    Updated: 2022/02/07 16:20:40 by anguinau         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= so_long
SRCS		= src/main.c \
		  src/parsing.c \
		  src/check_map_infos.c \
		  src/create_map_tab.c \
		  src/mlx_start.c \
		  src/upload_sprites.c \
		  src/reversed_char.c \
		  src/key_hook.c \
		  src/loop_hook.c \
		  src/loop_hook_bis.c \
		  src/draw.c \
		  src/free_map_infos.c \
		  src/assign_sprites.c
OBJS		= $(SRCS:.c=.o)
CC		= gcc
CFLAGS		= -Wall -Wextra -Werror -fsanitize=address
INCLUDES	= mlx_linux/ -lmlx -lXext -lX11
RM		= rm -f

.c.o			:
				${CC} ${CFLAGS} -c $< -o ${<:.c=.o} 

all			:	${NAME}

make_mlx		:
				cd mlx_linux && make

clean_mlx		:
				cd mlx_linux && make clean


${NAME}			:	make_mlx ${OBJS}
				${CC} ${CFLAGS} -o ${NAME} ${OBJS} -L ${INCLUDES} 

clean			:
				${RM} ${OBJS}

fclean			:	clean
					${RM} ${NAME}

re			:	fclean all

.PHONY			:	all clean fclean re
