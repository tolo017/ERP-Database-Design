# E-commerce Database System

This repository contains a simplified SQL database schema for an e-commerce platform, designed as a group assignment solution.

## Database Overview

The database supports core e-commerce functionality including:
- Product catalog with variations
- Inventory management
- Product categorization
- Brand management
- Product attributes and specifications

## Schema Structure

### Core Tables
1. `brand` - Stores brand information
2. `category` - Hierarchical product categories
3. `product` - Main product information
4. `product_item` - Specific product variants/SKUs
5. `product_image` - Product images
6. `product_attribute` - Product specifications

### Supporting Tables
1. `size` - Available size options
2. `color` - Available color options

## Installation

1. Run the SQL script in your MySQL/MariaDB environment:
   ```sql
   mysql -u username -p < ecommerce.sql