# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: malfwa <malfwa@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/28 12:39:34 by malfwa            #+#    #+#              #
#    Updated: 2023/03/28 13:04:46 by malfwa           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	libft.a

################################################################################
#                                                                              #
#                                                                              #
#                                  VARIABLES                                   #
#                                                                              #
#                                                                              #
################################################################################

SRC_DIR		=	srcs/


SRC			=	ft_atoi.c		\
				ft_bzero.c		\
				ft_calloc.c		\
				ft_isalnum.c	\
				ft_isalpha.c	\
				ft_isascii.c	\
				ft_isdigit.c	\
				ft_isprint.c	\
				ft_itoa.c		\
				ft_memchr.c		\
				ft_memcmp.c		\
				ft_memcpy.c		\
				ft_memmove.c	\
				ft_memset.c		\
				ft_putchar_fd.c	\
				ft_putstr_fd.c	\
				ft_putendl_fd.c	\
				ft_putnbr_fd.c	\
				ft_strchr.c		\
				ft_strlcat.c	\
				ft_striteri.c	\
				ft_strjoin.c	\
				ft_strlcpy.c	\
				ft_strlen.c		\
				ft_split.c		\
				ft_strmapi.c	\
				ft_strdup.c		\
				ft_strncmp.c	\
				ft_strnstr.c	\
				ft_strchr.c		\
				ft_strtrim.c	\
				ft_strrchr.c	\
				ft_substr.c		\
				ft_tolower.c	\
				ft_toupper.c

SRC_BONUS	=	ft_lstnew.c			\
				ft_lstsize.c		\
				ft_lstlast.c		\
				ft_lstadd_front.c	\
				ft_lstadd_back.c	\
				ft_lstdelone.c		\
				ft_lstclear.c		\
				ft_lstiter.c		\
				ft_lstmap.c

OBJ			=	$(addprefix $(OBJ_DIR), $(SRC:.c=.o))

OBJ_BONUS	=	$(addprefix $(OBJ_DIR), $(SRC_BONUS:.c=.o))

DEPS		=	$(OBJ:.o=.d)
DEPS		+=	$(OBJ_BONUS:.o=.d)

LC			=	ar rc

CC			=	cc

CFLAGS		+= -Wall -Werror -Wextra -MMD -MP

OBJ_DIR		=	.build/

INC			=	-I./includes

################################################################################
#                                                                              #
#                                                                              #
#                                    RULES                                     #
#                                                                              #
#                                                                              #
################################################################################

all:	$(NAME)
	
$(OBJ_DIR):
	mkdir .build

$(OBJ_DIR)%.o:	$(SRC_DIR)%.c
	$(CC) $(CFLAGS) -c $< -o $@ $(INC)


$(NAME):	Makefile $(OBJ_DIR) $(OBJ)
	$(LC) $(NAME) $(OBJ)

bonus:	$(OBJ_BONUS) $(OBJ)
	$(LC) $(NAME) $(OBJ) $(OBJ_BONUS)

clean:
	rm -rf $(OBJ_DIR)

fclean:	clean
	rm -f $(NAME)

re: fclean all

.PHONY: bonus clean fclean all re

-include $(DEPS)