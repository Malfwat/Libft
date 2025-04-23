/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: malfwa <malfwa@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/11/08 15:02:39 by amouflet          #+#    #+#             */
/*   Updated: 2022/11/11 23:57:15 by malfwa           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <stdbool.h>

bool	is_white_space(char c)
{
	return ((c <= 13 && c >= 9) || c == 32);
}

bool	is_digit(char c)
{
	return (c <= '9' && c >= '0');
}

int	ft_atoi(const char *nptr)
{
	int	sign;
	int	value;
	int	i;

	i = 0;
	value = 0;
	sign = 1;
	if (!nptr)
		return (0);
	while (is_white_space(nptr[i]))
		i++;
	if (nptr[i] == '-' || nptr[i] == '+')
	{
		if (nptr[i] == '-')
			sign = -1;
		i++;
	}
	while (is_digit(nptr[i]))
	{
		value = value * 10 + nptr[i] - 48;
		i++;
	}
	return (sign * value);
}
