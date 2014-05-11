#include <parse_instruction.h>
#include <polio.h>

static int string_to_int(char* str)
{
	int k = 0;
	int digit;
	int ret = 0; 
	while ((str[k] >= '0') && (str[k] <= '9'))
	{
		digit = str[k] - '0';
		ret = (10 * ret) + digit;
		k++;
	}

	return ret;
}
		 

int parse_instruction(char* instruction, char* ret)
{
	char train_number, train_speed, switch_number, switch_direction;
	int switch_position_number;
	while((*instruction == ' ') || (*instruction == '\t'))
	{
		instruction++;
	}

	if (instruction[0] == 't')
	{
		if (instruction[1] == 'r')
		{
			instruction+=2;
			if ((*instruction == ' ') || (*instruction == '\t'))	
			{
				while((*instruction == ' ') || (*instruction == '\t'))
				{
					instruction++;
				}
				if ((*instruction >= '0') && (*instruction <= '9'))
				{
					train_number = string_to_int(instruction);
					
					while((*instruction >= '0') && (*instruction <= '9'))
					{
						instruction++;
					}
					if ((*instruction == ' ') || (*instruction == '\t'))
					{
						while ((*instruction == ' ') || (*instruction == '\t'))
						{
							instruction++;
						}
						if ((*instruction >= '0') && (*instruction <= '9'))
						{	
							train_speed = string_to_int(instruction);
							while((*instruction >= '0') && (*instruction <= '9'))
							{
								instruction++;
							}
							while ((*instruction == ' ') || (*instruction == '\t'))
							{
								instruction++;
							}
							if ((*instruction == '\n') || (*instruction == '\r'))
							{
								ret[0] = train_speed;
								ret[1] = train_number;
								ret[2] = 0;
								return 2;
							}
						}
					}

				}
			}

		}
	}
	else if (instruction[0] == 'r')
	{
		if (instruction[1] == 'v')
		{
			instruction+= 2;
			if ((*instruction == ' ') || (*instruction == '\t'))
			{
				while((*instruction == ' ') || (*instruction == '\t'))
				{
					instruction++;
				}
				if ((*instruction >= '0') && (*instruction <= '9'))
				{
					train_number = string_to_int(instruction);
					while((*instruction >= '0') && (*instruction <= '9'))
					{
						instruction++;
					}
					while((*instruction == ' ') || (*instruction == '\t'))
					{
						instruction++;
					}
					if ((*instruction == '\n') || (*instruction == '\r'))
					{
						ret[0] = 15;
						ret[1] = train_number;
						ret[2] = 0;
						return 2;
					}
				}
			}
		}
	}
	else if (instruction[0] == 's')
	{
		if (instruction[1] == 'w')
		{
			instruction +=2;
			if ((*instruction == ' ') || (*instruction == '\t'))
			{
				while ((*instruction == ' ') || (*instruction == '\t'))
				{
					instruction++;
				}
				if ((*instruction >= '0') && (*instruction <= '9'))
				{
					if ((instruction[0] == '0') && (instruction[1] == 'x') && (instruction[2] == '9'))
					{
						switch(instruction[3])	
						{
							case '9':
								switch_number = 0x99;
								switch_position_number = 19;
								break;
							case 'A':

			
								switch_number = 0x9A;
								switch_position_number = 20;
								break;
							 case 'B': 
								switch_number = 0x9B;
								switch_position_number = 21;
								break;
							case 'C':
								switch_number = 0x9C;
								switch_position_number = 22;
								break;
							default:
								return 0;
						} 
					}
					else
					{
						switch_number = switch_position_number =  string_to_int(instruction);
					}
					while(((*instruction >= '0') && (*instruction <= '9')) || ((*instruction == 'A'))  || ((*instruction == 'B')) || ((*instruction == 'C')) || ((*instruction == 'x')))
					{
						instruction++;
					}
					while ((*instruction == ' ') || (*instruction == '\t'))
					{
						instruction++;
					}
					if ((*instruction == 'S'))
					{
						switch_states[switch_position_number] = 'S';
						switch_direction = 33;
						switch_states_changed = 1;
					}
					else if ((*instruction == 'C'))
					{
						switch_states[switch_position_number] = 'C';
						switch_direction = 34;
						switch_states_changed = 1;
					}
					else
					{
						return 0;
					}
					instruction++;
					while ((*instruction == ' ') || (*instruction == '\t'))
					{
						instruction++;
					}
					if ((*instruction == '\n') || (*instruction == '\r'))
					{
						ret[0] = switch_direction;
						ret[1] = switch_number;
						ret[2] = 32;
						return 3;
					}
				}
			}
		}
	}
	else if (instruction[0] == 'q')
	{
		instruction ++;
		while ((*instruction == ' ') || (*instruction == '\t'))
		{
			instruction++;
		}
		if ((*instruction == '\n') || (*instruction == '\r'))
		{
			q = 1;
			return 0;
		}
	}

	return 0;
		
}

	
